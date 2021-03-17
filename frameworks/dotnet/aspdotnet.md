# ASP.NET Core
ASP.NET is a collection of technologies to develop web applications.
* ASP.NET Web Forms
* ASP.NET MVC
* ASP.NET Core

## Architecture
* Host (management of request pipeline): configuration of components, self-hosting
* Server (listening for requests and forwarding them to the pipeline): IIS, Http.sys, Kestrel
* Midddleware (component of the pipeline, processes requests): request/response context, configured in `Startup` class
* Application: Web- or SignalR application, REST-Service, ...

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
```cs
public class ConverterController : Controller
{
    public ConverterController(ICurrencyCalculator currencyCalculator)
    {
        Logic = currencyCalculator;
    }

    private ICurrencyCalculator Logic { get; }

    [HttpGet]
    public async Task<IActionResult> Index()
    {
        IEnumerable<CurrencyData> currencyData = await GetDataForAllCurrencies();

        var model = new ConverterViewModel
        {
            Currencies = ConvertCurrencyList(currencyData),
            SourceCurrency = "EUR",
            TargetCurrency = "USD"
        };

        return View(model);
    }

    [HttpPost]
    public async Task<IActionResult> Index(ConverterViewModel model)
    {
        var currencyData = await GetDataForAllCurrencies();
        model.Currencies = ConvertCurrencyList(currencyData);

        if (!ModelState.IsValid)
        {
            return View(model);
        }

        ModelState.Clear();

        model.TargetValue = model.SourceValue * await Logic.RateOfExchangeAsnyc(model.SourceCurrency, model.TargetCurrency);
        return View(model);
    }

    private async Task<IEnumerable<CurrencyData>> GetDataForAllCurrencies()
    {
        var currencies = (await Logic.GetCurrenciesAsync())
                .Select(async symbol => await Logic.GetCurrencyDataAsync(symbol));
        return await Task.WhenAll(currencies);
    }

    private IEnumerable<SelectListItem> ConvertCurrencyList(IEnumerable<CurrencyData> currencyData)
    {
        return currencyData.Select(cd =>
            new SelectListItem
            {
                Value = cd.Symbol,
                Text = $"{cd.Symbol} ({cd.Name})"
            });
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
@model IEnumerable<PersonModel>
<html>
<body>
  @if (Model.Any())
  {
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
  @else
  {
    <p>No persons in list.</p>
  }
</body>
</html>
```
