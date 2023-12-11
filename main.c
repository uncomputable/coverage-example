#include <stdio.h>
#include "foo.h"

void used_main() {}
void unused_main() {}

int main() {
    used_main();
    used_foo();
    printf("Finished.\n");
    return 0;
}
