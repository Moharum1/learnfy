using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using IBSRA.Services;

namespace IBSRA.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/categories")]
    public class CategoriesController : ApiController
    {
        private readonly ICategoryService _categoryService;

        public CategoriesController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        [HttpGet, Route("")]
        public async Task<IHttpActionResult> GetAllCategories([FromUri] bool includeInactive = false)
        {
            var result = await _categoryService.GetAllCategoriesAsync(includeInactive);
            return Ok(result);
        }

        [HttpGet, Route("popular")]
        public async Task<IHttpActionResult> GetPopularCategories([FromUri] int count = 5)
        {
            var result = await _categoryService.GetPopularCategoriesAsync(count);
            return Ok(result);
        }

        [HttpGet, Route("{id:int}")]
        public async Task<IHttpActionResult> GetCategoryById(int id)
        {
            var result = await _categoryService.GetCategoryByIdAsync(id);
            return Ok(result);
        }

        [HttpGet, Route("{name}")]
        public async Task<IHttpActionResult> GetCategoryByName(string name)
        {
            var result = await _categoryService.GetCategoryByNameAsync(name);
            return Ok(result);
        }
    }
}