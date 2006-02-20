#define ERROR_EXPIRED (0<<3)
#define ERROR_IO (1<<3)
#define ERROR_UNDEFINED_WORD (2<<3)
#define ERROR_TYPE (3<<3)
#define ERROR_FLOAT_FORMAT (4<<3)
#define ERROR_SIGNAL (5<<3)
#define ERROR_NEGATIVE_ARRAY_SIZE (6<<3)
#define ERROR_C_STRING (7<<3)
#define ERROR_FFI (8<<3)
#define ERROR_HEAP_SCAN (9<<3)
#define ERROR_UNDEFINED_SYMBOL (10<<3)
#define ERROR_USER_INTERRUPT (11<<3)
#define ERROR_DS_UNDERFLOW (12<<3)
#define ERROR_DS_OVERFLOW (13<<3)
#define ERROR_CS_UNDERFLOW (14<<3)
#define ERROR_CS_OVERFLOW (15<<3)
#define ERROR_OBJECTIVE_C (16<<3)

/* Are we throwing an error? */
bool throwing;
/* When throw_error throws an error, it sets this global and
longjmps back to the top-level. */
CELL thrown_error;
CELL thrown_keep_stacks;
/* Since longjmp restores registers, we must save all these values.
On x86, only the first is in a register; on PowerPC, all are. */
CELL thrown_ds;
CELL thrown_cs;
CELL thrown_callframe;
CELL thrown_executing;

void fatal_error(char* msg, CELL tagged);
void critical_error(char* msg, CELL tagged);
void throw_error(CELL error, bool keep_stacks);
void early_error(CELL error);
void general_error(CELL error, CELL tagged, bool keep_stacks);
void signal_error(int signal);
void signal_stack_error(bool is_return_stack, bool is_overflow);
void type_error(CELL type, CELL tagged);
void primitive_throw(void);
void primitive_die(void);
