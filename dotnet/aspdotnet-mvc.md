# ASP.NET MVC

## Directory Structure
* wwwroot: root directory of web server
* ClientApp: single page web application
* Controllers/Pages/Views: server side web application
* Startup.cs: configuration of app components and middleware
* Program.cs: host configuration

## Controllers
```cs
public class MoviesController : Controller
{
  private readonly IMovieLogic movies = new MovieLogic();
  
  // GET: movies
  public ActionResult Index()
  {
    var model = movies.FindAll().Select(movie => new MovieModel(movie));
    return View("Index", model);
  }
  
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
```cshtml
@model Vidly.Models.Movie
@{
  ViewBag.Title = "Random";
  Layout = "~/Views/Shared/_Layout.cshtml";
}

<h2>@Model.Name</h2>
```
```cshtml
@model IEnumerable
<PersonModel
>
<html>
<body>
  @if (Model.Any()) {
    <table border="1">
    <tr>…</tr> 
    @foreach (PersonModel p in Model) {
      <tr>
        <td>@p.FirstName</td>
        <td>@p.LastName</td>
        <td>@p.Email</td>
      </tr>
    }
    </table>
  }
  @else {
    <p>No persons in list.</p>
  }
</body>
</html>
```
