{
  clipboard = {
    providers = {
      wl-copy.enable = true;
      xsel.enable = true;
    };
    register = "unnamedplus";
  };

  opts = {
    breakindent = true; # Visually indents wrapped lines to align with the start of the original line
    cursorline = true; # Highlights the line where the cursor is located
    ignorecase = true; # Makes search patterns case-insensitive unless explicitly overridden
    inccommand = "split"; # Displays the effects of substitutions commands in real-time
    list = true; # Enable visual representation of whitespace characters
    listchars = # Defines the characters used to visually represent whitespace characters
      {
        nbsp = "␣";
        tab = "» ";
        trail = "·";
      };
    mouse = "a"; # Enables mouse support in all modes
    number = true; # Displays line numbers next to each line in the current window
    relativenumber = true; # Displays line numbers relative to the cursor's position
    ruler = false; # Displays the cursor line and column number, and file relative position in the status line
    scrolloff = 10; # Sets the minimum number of lines to keep visible above and below the cursor
    showmode = false; # Displays the current mode in the status line
    signcolumn = "yes"; # Always show the sign column
    smartcase = true; # Makes search patterns case-sensitive if they contain an uppercase character
    splitbelow = true; # Splits windows below the current window
    splitright = true; # Splits windows to the right of the current window
    termguicolors = true; # Enables true 24-bit RGB color in the terminal
    timeoutlen = 300; # Time in milliseconds to wait for a mapped sequence to complete.
    updatetime = 250; # Sets the time in milliseconds of inactivity before writing the swap file to disk and triggering the CursorHold event.
    undofile = true; # Enables saving and restoring undo history to a file
  };
}
