with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AWS.Client;
with AWS.Response;
--  with GNATCOLL.JSON;

procedure VulgarVelma is

   User_Agent : constant String :=
      "VulgarVelma (https://github.com/esthermations/VulgarVelma, 0.0.0)";

   Discord_API_URL  : constant String := "https://discord.com/api/v8";
   --  Certificate_Path : constant String :=
   --     "/Users/estherokeefe/Documents/vulgarvelma.cer";

   Response      : AWS.Response.Data;
   Response_Body : Unbounded_String;
begin

   Response := AWS.Client.Get (URL         => Discord_API_URL,
                               --  Certificate => Certificate_Path,
                               User_Agent  => User_Agent);

   Response_Body := AWS.Response.Message_Body (Response);

   --  Send this to request a gateway endpoint which we will connect to.
   Put_Line ("Response: ");
   Put ("[");
   Put (To_String (Response_Body));
   Put ("]");
   New_Line;
   Put_Line ("User_Agent: " & User_Agent);
end VulgarVelma;
