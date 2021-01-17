with Ada.Text_IO; use Ada.Text_IO;

with AWS.Client;
with AWS.Response;
with GNATCOLL.JSON; use GNATCOLL.JSON;

with VulgarVelma.Globals;

separate (VulgarVelma.Main)
function Get_Gateway_URL return String is
   Response : constant AWS.Response.Data :=
      AWS.Client.Get (URL         => Globals.Discord_API_URL & "/gateway",
                      User_Agent  => Globals.User_Agent);

   Content : constant Unbounded_String := AWS.Response.Message_Body (Response);
   Obj     : constant JSON_Value       := Read (Content);
   URL     : constant String           := Obj.Get ("url");
begin
   return URL;
end Get_Gateway_URL;