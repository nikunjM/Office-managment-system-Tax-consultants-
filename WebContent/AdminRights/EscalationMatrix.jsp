<html>
	<head>
		<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>
		<script>
		$(document).ready(function() {
			var id = 0;
			
			// Add button functionality
			$("table.dynatable button.add").click(function() {
				id++;
				var master = $(this).parents("table.dynatable");
				// Get a new row based on the prototype row
				var prot = master.find(".prototype").clone();
				prot.attr("class", "")
				prot.find(".id").attr("value", id);
				master.find("tbody").append(prot);
			});
			// Remove button functionality
			$("table.dynatable button.remove").live("click", function() {
				$(this).parents("tr").remove();
			});
		});
		</script>
		<style>
			.dynatable {
				border: solid 1px #000; 
				border-collapse: collapse;
			}
			.dynatable th,
			.dynatable td {
				border: solid 1px #000; 
				padding: 2px 10px;
				width: 170px;
				text-align: center;
			}
			.dynatable .prototype {
				display:none;
			}
		</style>
	</head>
	<body>
		<table class="dynatable">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Col 3</th>
					<th>Col 4</th>
					<th><button class="add">Add</button></th>
				</tr>
			</thead>
			<tbody>
				<tr class="prototype">
					<td><input type="text" name="id[]" value="0" class="id" /></td>
					<td><input type="text" name="name[]" value="" /></td>
					<td><input type="text" name="col4[]" value="" /></td>
					<td><input type="text" name="col3[]" value="" /></td>
					<td><button class="remove">Remove</button>
				</tr>
		</table>
	</body>
</html>