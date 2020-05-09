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