<h1>Add Park Details</h1>
<form action="/teams" method="post">
  Park Name: <input type="text" name="team[name]">
  <br>
  <br>
  Team Motto: <input type="text" name="team[motto]">
  <br>
  <br>
  City: <input id="member1_name" type="text" name="team[members][][name]">
  <br>
  <br>
  State: <input id="member1_power" type="text" name="team[members][][power]">
  <br>
  <br>
  Notes: <input id="member1_bio" type="text" name="team[members][][bio]">
  <br>
  <br>
  <input id= "submit" type="submit">
</form>


<% if Park.all.empty? %>
    <h4>Looks like you haven't visited any national parks.</h4>
    <br>
    <a href='/parks/new'><button>Click to get started</button></a>
<% else %>
    <% Park.all.each do |p| %>
    <h3><%= p.name %></h3> 
    <form action="/parks/<%=p.id%>">
        <input type="submit" value="See Details" />
    </form>
    ---------------------------------------------------
    <% end %>
<% end %>

# this is the edit.erb
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Park Details</title>
<link rel="stylesheet" type="text/css" href="view.css" media="all">
<script type="text/javascript" src="view.js"></script>

</head>
<body id="main_body" >
	
	<img id="top" src="top.png" alt="">
	<div id="form_container">
	
		<h1><a>Park Details</a></h1>
		<form id="form_109257" class="appnitro"  method="post" action="/parks/<%=@park.id%>">
		<input id="hidden" type="hidden" name="_method" value="patch">
					<div class="form_description">
			<p>Enter the data from the National Park:</p>
		</div>						
			<ul >
			
					<li id="li_1" >
		<label class="description" for="element_1">Park Name: </label>
		<div>
			<input id="park_name" value= "<%=@park.name%>" name="park_name" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		</li>		<li id="li_2" >
		<label class="description" for="element_2">City: </label>
		<div>
			<input id="city" value= "<%=@park.city%>" name="city" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		</li>		<li id="li_3" >
		<label class="description" for="element_3">State: </label>
		<div>
			<input id="state" value= "<%=@park.state%>" name="state" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		</li>		<li id="li_4" >
		<label class="description" for="element_4">Date Visited - MM-DD-YYYY: </label>
		<div>
			<input id="date_visited" value= "<%=@park.date_visited%>" name="date_visited" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		</li>		<li id="li_5" >
		<label class="description" for="element_5">Notes: </label>
		<div>
			<textarea id="notes" name="notes" class="element textarea medium"><%=@park.notes%></textarea> 
		</div> 
		</li>
			
					<li class="buttons">
			    <input type="hidden" name="form_id" value="109257" />
			    <br>
				<input id="saveForm" class="button_text" type="submit" name="submit" value="Update" />
		</li>
			</ul>
		</form>	
		<div id="footer">
			
		</div>
	</div>
    <img id="bottom" src="bottom.png" alt="">

	</body>
</html>


<form action="/parks/<%=p.id%>/delete" method="POST">
<input type="hidden" name="_method" id="hidden" value="DELETE">
<input type='submit' value= 'Delete'>
</form>