#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>
#!/bin/bash

# 1. 检查参数个数
if [ $# -ne 1 ]; then
    echo "Usage: $0 FILE" >&2
    exit 1
fi

LOG="$1"

# 2. 检查文件是否存在
if [ ! -f "$LOG" ]; then
    echo "Error: file not found: $LOG" >&2
    exit 1
fi

# 3. 统计 ERROR 条数
total_error=$(grep -c "ERROR" "$LOG")

# 4. 找出现次数最多的错误码
top_code=$(grep "ERROR" "$LOG" | grep -oE "code=[0-9]+" | cut -d= -f2 | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')

# 5. 输出
echo "Total ERROR: $total_error"
echo "Top Code: $top_code"

