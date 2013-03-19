/*
** Copyright (C) 2013 Severin Heiniger <severinheiniger@gmail.com>
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

public class Valint.Main : GLib.Object {

	private static int level = 3;
	private static bool debug = false;
	private static bool version = false;

	private static const OptionEntry[] option_entries = {
		{ "verbosity", 'v', 0, OptionArg.INT, ref level,
				"Set verbosity of warnings, from severe (1) to " +
				"suggestion (5)", null },
		{ "debug", 'd', 0, OptionArg.NONE, ref debug,
				"Show debug messages", null },
		{ "version", 0, 0, OptionArg.NONE, ref version,
				"Show the version of the program", null },
		{ null }
	};

	public static int main (string[] args) {
		Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.LOCALEDIR);
		Intl.bind_textdomain_codeset (Config.GETTEXT_PACKAGE, "UTF-8");
		Intl.textdomain (Config.GETTEXT_PACKAGE);
		
		var option_context = new OptionContext ("- vala code analyzer");
		option_context.set_help_enabled (true);
		option_context.add_main_entries (option_entries, null);
		
		try {
			option_context.parse (ref args);
		} catch (OptionError error) {
			stderr.printf ("option parsing failed: %s\n", error.message);
			return 1;
		}

		if (version) {
			stdout.printf ("Valint %s\n", Config.PACKAGE_VERSION);
			return 0;
		}

		if (debug) {
			Environment.set_variable ("G_MESSAGES_DEBUG", "all", true);
		}

		return 0;
	}

}
