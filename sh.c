#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <signal.h>
#include <readline/readline.h>
#include <readline/history.h>

#define PROMPT "mysh$ "

int flex_scan_str(const char *str);
int flex_scan_file(const char *path);

void sigint_handler(int sig) {
	(void)sig;

	/* move readline to a new empty line */
	rl_crlf();
	rl_on_new_line();
	rl_replace_line("", 0);
	rl_redisplay();
}


int main(int argc, char **argv) {
	signal(SIGINT, sigint_handler);

	char *line;
	while (true) {
		line = readline(PROMPT);
		if (line && *line) {
			add_history(line);
			flex_scan_str(line);
			free(line);
		} else {
			fprintf(stderr, "exit\n");
			exit(0);
		}
	}
}
