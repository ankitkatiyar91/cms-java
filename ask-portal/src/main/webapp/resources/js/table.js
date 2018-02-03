// method create table dynamically
function createDynamicTable(divID,fields,json){
	$str="";
	//alert("divID->"+divID);
	$(divID).html('');
	//starting table
	//reading fields and generating header string
			$.each(fields, function(key,value){
					$str+="<th>"+value.title+"</th>";
				});
				var $table = $('<table width="100%" border="0" cellspacing="0" cellpadding="0" >');
				// thead
				$table.append('<thead>').children('thead')
				.append('<tr />').children('tr').append($str);
				//tbody
				var $tbody = $table.append('<tbody />').children('tbody');
				
				// add row
				var $row;
				$.each(json, function(key,value){
					$row=$tbody.append('<tr />').children('tr:last');
						//loop to generate columns for one row with cssClass
						$.each(fields, function(fieldsKey,fieldsValue){
							$row.append('<td />').children('td:last')
							.append(value[fieldsKey])
							.addClass(fieldsValue.cssClass);
						});	
						
				});
				$table.appendTo(divID);
}

function createDynamicTableWithArray(divID,fields,json){
//	console.log(json);
	$str="";
	//alert("divID->"+divID);
	$(divID).html('');
	//starting table
	//reading fields and generating header string
			$.each(fields, function(key,value){
					$str+='<th id="'+value.id+'" >'+value.title+'</th>';
				});
				var $table = $('<table width="100%" border="0" cellspacing="0" cellpadding="0" >');
				// thead
				$table.append('<thead>').children('thead')
				.append('<tr />').children('tr').append($str);
				//tbody
				var $tbody = $table.append('<tbody />').children('tbody');
				
				// add row
				var $row;
				$.each(json, function(key,value){
					$row=$tbody.append('<tr />').children('tr:last');
						//loop to generate columns for one row with cssClass
						$.each(fields, function(fieldsKey,fieldsValue){
							//alert(fieldsKey+"   --> "+value[fieldsKey]+"--->");
							$row.append('<td />').children('td:last')
							.append(value[fieldsValue.id])
							.addClass(fieldsValue.cssClass);
						});	
						
				});
				$table.appendTo(divID);
}