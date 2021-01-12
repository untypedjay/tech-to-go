# ASP.NET MVC

## Controllers
```cs
public class MoviesController : Controller
{
  // GET: movies/random
  public ActionResult Random()
  {
    var movie = new Movie() { Name = "Shrek!" };
    
    return View(movie);
  }
  
  // GET: movies/edit?id=1
  public ActionResult Edit(int id)
  {
    return Content("id=" + id);
  }
  
  // GET: movies?pageIndex=2&sortBy=ReleaseDate
  public ActionResult Index(int? pageIndex, string sortBy)
  {
    ...
  }
  
  [Route("movies/released/{year}/{month:regex(\\d{4})}")]
  public ActionResult ByReleaseYear(int year, int month)
  {
    return Content(year + "/" + month);
  }
}
```

### Action Results
|Type|Helper Method|
|:---:|:---:|
|ViewResult|View()|
|PartialViewResult|PartialView()|
|ContentResult|Content()|
|RedirectResult|Redirect()|
|RedirectToRouteResult|RedirectToAction()|
|JsonResult|Json()|
|FileResult|File()|
|HttpNotFoundResult|HttpNotFound()|
|EmptyResult|-|

## Views
```cs
@model Vidly.Models.Movie
@{
  ViewBag.Title = "Random";
  Layout = "~/Views/Shared/_Layout.cshtml";
}

<h2>@Model.Name</h2>
```
