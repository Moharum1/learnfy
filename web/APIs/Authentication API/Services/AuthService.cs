using AutoMapper;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using YourApp.Models;
using YourApp.Models.DTOs;
using YourApp.Repositories;
using BCrypt.Net;

namespace YourApp.Services
{
    public class AuthService : IAuthService
    {
        private readonly IUserRepository _userRepository;
        private readonly IConfiguration _config;
        private readonly IMapper _mapper;

        public AuthService(IUserRepository userRepository, IConfiguration config, IMapper mapper)
        {
            _userRepository = userRepository;
            _config = config;
            _mapper = mapper;
        }

        public async Task<AuthResponse> LoginAsync(LoginRequest request)
        {
            // Business logic: Validate login credentials
            var user = await _userRepository.GetByEmailAsync(request.Email);

            // Business logic: Check if user exists and password is valid
            if (user == null || !ValidatePassword(request.Password, user.PasswordHash))
                return new AuthResponse(false, "Invalid email or password");

            // Business logic: Generate authentication response
            var token = GenerateJwtToken(user);
            var userDto = _mapper.Map<UserDto>(user);

            return new AuthResponse(true, "Login successful", token, userDto);
        }

        public async Task<AuthResponse> RegisterAsync(RegisterRequest request)
        {
            // Business logic: Check if user already exists
            if (await _userRepository.EmailOrUsernameExistsAsync(request.Email, request.Username))
                return new AuthResponse(false, "User with this email or username already exists");

            // Business logic: Create new user with hashed password
            var user = CreateUserFromRequest(request);
            
            // Repository handles data persistence
            await _userRepository.CreateAsync(user);

            // Business logic: Generate authentication response for new user
            var token = GenerateJwtToken(user);
            var userDto = _mapper.Map<UserDto>(user);

            return new AuthResponse(true, "Registration successful", token, userDto);
        }

        public async Task<AuthResponse> ForgotPasswordAsync(ForgotPasswordRequest request)
        {
            // Business logic: Find user and validate request
            var user = await _userRepository.GetByEmailAsync(request.Email);
            
            if (user == null)
                return new AuthResponse(false, "No user found with this email address");

            // Business logic: Generate reset token and set expiry
            user.ResetToken = GenerateResetToken();
            user.ResetTokenExpiry = CalculateResetTokenExpiry();

            // Repository handles data persistence
            await _userRepository.UpdateAsync(user);
            await _userRepository.SaveChangesAsync();

            // Business logic: In production, send email here
            return new AuthResponse(true, "Password reset token generated", Data: user.ResetToken);
        }

        public async Task<AuthResponse> ResetPasswordAsync(ResetPasswordRequest request)
        {
            // Business logic: Validate reset token and check expiry
            var user = await _userRepository.GetByResetTokenAsync(request.ResetToken);

            if (user == null)
                return new AuthResponse(false, "Invalid or expired reset token");

            // Business logic: Update password and clear reset token
            user.PasswordHash = HashPassword(request.NewPassword);
            user.ResetToken = null;
            user.ResetTokenExpiry = null;

            // Repository handles data persistence
            await _userRepository.UpdateAsync(user);
            await _userRepository.SaveChangesAsync();

            return new AuthResponse(true, "Password reset successful");
        }

        // Business logic helper methods
        private bool ValidatePassword(string password, string passwordHash)
        {
            return BCrypt.Verify(password, passwordHash);
        }

        private string HashPassword(string password)
        {
            return BCrypt.HashPassword(password);
        }

        private User CreateUserFromRequest(RegisterRequest request)
        {
            return new User
            {
                Name = request.Name,
                Age = request.Age,
                PhoneNumber = request.PhoneNumber,
                Email = request.Email,
                Username = request.Username,
                PasswordHash = HashPassword(request.Password)
            };
        }

        private string GenerateResetToken()
        {
            return Guid.NewGuid().ToString("N");
        }

        private DateTime CalculateResetTokenExpiry()
        {
            return DateTime.UtcNow.AddHours(1);
        }

        private string GenerateJwtToken(User user)
        {
            var key = Encoding.UTF8.GetBytes(_config["Jwt:Key"]);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                    new Claim(ClaimTypes.Name, user.Username),
                    new Claim(ClaimTypes.Email, user.Email)
                }),
                Expires = DateTime.UtcNow.AddMinutes(int.Parse(_config["Jwt:ExpiryMinutes"])),
                Issuer = _config["Jwt:Issuer"],
                Audience = _config["Jwt:Audience"],
                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(key), 
                    SecurityAlgorithms.HmacSha256Signature)
            };

            var tokenHandler = new JwtSecurityTokenHandler();
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
