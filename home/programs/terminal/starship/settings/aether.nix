let
  color = s: c: "[${s}](${c})";
in
{
  add_newline = false;

  format = "$username@$hostname >";

  hostname = {
    format = "$user";
    ssh_only = false;
  };

  username = {
    format = "$hostname";
    show_always = true;
  };
}
