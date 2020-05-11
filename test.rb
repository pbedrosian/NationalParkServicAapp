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