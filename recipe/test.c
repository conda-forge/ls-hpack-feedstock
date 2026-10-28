#include <lshpack.h>

int main(void)
{
    struct lshpack_enc enc;
    struct lshpack_dec dec;
    if (lshpack_enc_init(&enc) != 0)
        return 1;
    lshpack_dec_init(&dec);
    lshpack_enc_cleanup(&enc);
    lshpack_dec_cleanup(&dec);
    return 0;
}
