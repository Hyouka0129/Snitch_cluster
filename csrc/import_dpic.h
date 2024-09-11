
 extern void tb_memory_read(/* INPUT */long long addr, /* INPUT */int len, const /* OUTPUT */svOpenArrayHandle data);

 extern void tb_memory_write(/* INPUT */long long addr, /* INPUT */int len, const /* INPUT */svOpenArrayHandle data, const /* INPUT */svOpenArrayHandle strb);

 extern void* svapfGetAttempt(/* INPUT */unsigned int assertHandle);

 extern void svapfReportResult(/* INPUT */unsigned int assertHandle, /* INPUT */void* ptrAttempt, /* INPUT */int result);

 extern int svapfGetAssertEnabled(/* INPUT */unsigned int assertHandle);
