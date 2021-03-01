# ASP.NET RESTful Web-Services

## Successful Web Architecture
* addressable resources: resources are the center (vs method centered -> SOAP)
* uniform, constrained interface (HTTP methods)
* representation oriented: resources in different representations (XML, JSON, YAML, ...)
* communicate statelessly
* Hypermedia As The Engine Of Application State(HATEOAS): resources contain links to possible operations

## Controller
* every HTTP request gets routed to a controller
* request data already in correct format when entering controller
* controller is connection to business logic
```cs
[Route("api/[controller]")]
[ApiController]
public class CurrenciesController : ControllerBase
{
    public CurrenciesController(ICurrencyCalculator logic)
    {
        Logic = logic;
    }

    private ICurrencyCalculator Logic { get; }

    [HttpGet]
    public async Task<IEnumerable<CurrencyData>> GetAll()
    {
        return await GetAllCurrencyDataAsync();
    }

    [HttpGet("{symbol}")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [OpenApiOperation("Currency details", "Returns detailed data for a given currency symbol")]
    public async Task<ActionResult<CurrencyData>> GetBySymbol(string symbol)
    {
        if (!await Logic.CurrencyExistsAsync(symbol))
        {
            return NotFound(StatusInfo.InvalidCurrencySymbol(symbol));
        }

        return await Logic.GetCurrencyDataAsync(symbol);
    }

    [HttpGet("{sourceSymbol}/rates/{targetSymbol}")]
    public async Task<ActionResult<double>> GetExchangeRate(string sourceSymbol, string targetSymbol)
    {
        if (!await Logic.CurrencyExistsAsync(sourceSymbol) || !await Logic.CurrencyExistsAsync(targetSymbol))
        {
            return NotFound();
        }

        return await Logic.RateOfExchangeAsnyc(sourceSymbol, targetSymbol);
    }

    [HttpPut]
    public async Task<ActionResult> Update([FromBody] CurrencyData data)
    {
        if (!await Logic.CurrencyExistsAsync(data.Symbol))
        {
            return NotFound();
        }

        await Logic.UpdateAsync(data);
        return NoContent();
    }

    [HttpPost]
    public async Task<ActionResult> Insert([FromBody] CurrencyData data)
    {
        if (await Logic.CurrencyExistsAsync(data.Symbol))
        {
            return Conflict();
        }

        await Logic.InsertAsnyc(data);
        return CreatedAtAction(nameof(GetBySymbol), new { symbol = data.Symbol }, null);
    }

    private async Task<IEnumerable<CurrencyData>> GetAllCurrencyDataAsync()
    {
        var tasks = (await Logic.GetCurrenciesAsync()).Select(async symbol => await Logic.GetCurrencyDataAsync(symbol));
        return await Task.WhenAll(tasks);
    }
}
```

## OpenAPI/Swagger
Purpose:
* generate documentation
* generate proxies classes (service or client)
