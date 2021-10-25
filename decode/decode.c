#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/*
 * opcode
 * 000000  R-format arithmetic
 * 001xxx  I-format immediate
 * 100xxx  Load
 * 101xxx  Store
 */

typedef union instruction {
    uint32_t raw;
    // R-format arithmetic instruction
    struct {
        uint32_t funct:6;
        uint32_t shamt:5;
        uint32_t rd:5;
        uint32_t rt:5;
        uint32_t rs:5;
        uint32_t op:6;
    };
    // I-format xfer, branch, and immediate instruction
    struct {
        uint32_t immed:16; // immediate or address offset
        uint32_t rt_i:5;
        uint32_t rs_i:5;
        uint32_t op_i:6;
    };
    // J-format jump instruction
    struct {
        uint32_t target:26; // target address
        uint32_t op_j:6;
    };
} instruction;

int main(int argc, char *argv[])
{
    if (argc != 3) {
        fprintf(stderr, "Usage: decode count file\n");
        exit(2);
    }

    int count = atoi(argv[1]);
    FILE *fp = fopen(argv[2], "rb");
    instruction *code;

    code = malloc(4 * count);
    if (fread(code, 4, count, fp) != count) {
        fprintf(stderr, "read error\n");
        exit(1);
    }

    for (int i = 0; i < count; i++) {
        instruction in = code[i];

        if (in.op == 0) {
            // R-format instruction
            printf("%08x R-format Rs=%d Rt=%d Rd=%d shamt=%d funct=%o\n",
                   in.raw, in.rs, in.rt, in.rd, in.shamt, in.funct);
        } else if (in.op & 0x38 == 8) {
            // I-format instruction
            printf("%08x I-format Rs=%d Rt=%d immed=%o\n",
                   in.raw, in.rs, in.rt, in.immed);
        } else if (in.op & 0x3e == 2) {
            // J-format instruction
            printf("%08x J-format address=%08x\n",
                   in.raw, in.target << 2);
        } else {
            printf("%08x\n", in.raw);
        }
    }

    return 0;
}
