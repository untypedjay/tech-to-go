# Tables

- `<colgroup>` specifies a group of one or more columns in a table for formatting

```html
<table>
	<caption>Monthly savings</caption>
	<colgroup>
    <col span="2" style="background-color:red">
    <col style="background-color:yellow">
  </colgroup>
	<thead>
		<tr>
			<th scope=“col”>Month</th>
			<th>Savings</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan=“2”>January</td>
			<td rowspan=“2”>$100</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td>Sum</td>
			<td>$100</td>
		</tr>
	</tfoot>
</table>
```
