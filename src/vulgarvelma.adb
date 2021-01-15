with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AWS.Client;
with AWS.Response;
with GNATCOLL.JSON;

procedure VulgarVelma is

   --  type Snowflake is new Interfaces.Unsigned_64;

   User_Agent : constant String :=
      "VulgarVelma (https://github.com/esthermations/VulgarVelma, 0.0.0)";

   Connection : AWS.Client.HTTP_Connection;

   Response      : AWS.Response.Data;
   Response_Body : Unbounded_String;
begin

   AWS.Client.Create
      (Connection  => Connection,
       Host        => "https://discord.com/api/v8",
       Certificate => "/Users/estherokeefe/Documents/vulgarvelma.cer",
       User_Agent  => User_Agent);

   AWS.Client.Get (Connection => Connection,
                   Result     => Response,
                   URI        => "/gateway");

   Response_Body := AWS.Response.Message_Body (Response);

   --  Send this to request a gateway endpoint which we will connect to.
   Put_Line ("Response: ");
   Put ("[");
   Put (To_String (Response_Body));
   Put ("]");
   New_Line;
end VulgarVelma;
