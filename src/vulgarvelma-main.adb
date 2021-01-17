with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure VulgarVelma.Main is
   function Get_Gateway_URL return String;
   function Get_Gateway_URL return String is separate;
   Gateway_URL : constant String := Get_Gateway_URL;
begin
   Put ("URL: ");
   Put_Line (Gateway_URL);
end VulgarVelma.Main;
