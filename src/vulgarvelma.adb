with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AWS.Client;
with AWS.Response;

procedure VulgarVelma is
   User_Agent : constant String := "VulgarVelma 0.0.0";

   Gateway_Get_Response      : AWS.Response.Data;
   Gateway_Get_Response_Body : Unbounded_String;
begin
   --  Send this to request a gateway endpoint which we will connect to.
   Gateway_Get_Response :=
      AWS.Client.Get (URL        => "https://discord.com/api/v8/gateway",
                      User_Agent => User_Agent);

   Gateway_Get_Response_Body :=
      AWS.Response.Message_Body (Gateway_Get_Response);

   Put_Line ("Response: ");
   Put ("[");
   Put (To_String (Gateway_Get_Response_Body));
   Put ("]");
   New_Line;
end VulgarVelma;
