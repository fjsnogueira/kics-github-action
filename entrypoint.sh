#!/bin/ash
DATETIME="`date '+%H:%M'`"

if [ -z "$INPUT_PATH" ]
then
      echo "${DATETIME} - ERR input path can't be empty"
      exit 1
else
      INPUT_PARAM="-p $INPUT_PATH"
fi

[[ ! -z "$INPUT_OUTPUT_PATH" ]] && OUTPUT_PATH_PARAM="-o $INPUT_OUTPUT_PATH"
[[ ! -z "$INPUT_PAYLOAD_PATH" ]] && PAYLOAD_PATH_PARAM="-d $INPUT_PAYLOAD_PATH"
[[ ! -z "$INPUT_CONFIG_PATH" ]] && CONFIG_PATH_PARAM="--config $INPUT_CONFIG_PATH"
[[ ! -z "$INPUT_EXCLUDE_PATHS" ]] && EXCLUDE_PATHS_PARAM="-e $INPUT_EXCLUDE_PATHS"
[[ ! -z "$INPUT_EXCLUDE_RESULTS" ]] && EXCLUDE_RESULTS_PARAM="-x $INPUT_EXCLUDE_RESULTS"
[[ ! -z "$INPUT_EXCLUDE_QUERIES" ]] && EXCLUDE_QUERIES_PARAM="--exclude-queries $INPUT_EXCLUDE_QUERIES"
[[ ! -z "$INPUT_EXCLUDE_CATEGORIES" ]] && EXCLUDE_CATEGORIES_PARAM="--exclude-categories $INPUT_EXCLUDE_CATEGORIES"
[[ ! -z "$INPUT_OUTPUT_FORMATS" ]] && OUTPUT_FORMATS_PARAM="--report-formats $INPUT_OUTPUT_FORMATS"
[[ ! -z "$INPUT_PLATFORM_TYPE" ]] && PLATFORM_TYPE_PARAM="--type $INPUT_PLATFORM_TYPE"
[[ ! -z "$INPUT_IGNORE_ON_EXIT" ]] && IGNORE_ON_EXIT_PARAM="--ignore-on-exit $INPUT_IGNORE_ON_EXIT"
[[ ! -z "$INPUT_FAIL_ON" ]] && FAIL_ON_PARAM="--fail-on $INPUT_FAIL_ON"
[[ ! -z "$INPUT_TIMEOUT" ]] && TIMEOUT_PARAM="--timeout $INPUT_TIMEOUT"
[[ ! -z "$INPUT_PROFILING" ]] && PROFILING_PARAM="--profiling $INPUT_PROFILING"
[[ ! -z "$INPUT_SECRETS_REGEXES_PATH" ]] && SECRETS_REGEXES_PATH="--secrets-regexes-path $INPUT_SECRETS_REGEXES_PATH"

[[ ! -z "$INPUT_VERBOSE" ]] && VERBOSE_PARAM="-v"

if [ ! -z "$INPUT_QUERIES" ]
then
    QUERIES_PARAM="-q $INPUT_QUERIES"
else
    QUERIES_PARAM="-q /app/bin/assets/queries"
fi

cd $GITHUB_WORKSPACE
echo "${DATETIME} - INF : about to scan directory $INPUT_PATH"
echo "${DATETIME} - INF : kics command kics $INPUT_PARAM $OUTPUT_PATH_PARAM $OUTPUT_FORMATS_PARAM $PLATFORM_TYPE_PARAM $PAYLOAD_PATH_PARAM $CONFIG_PATH_PARAM $EXCLUDE_PATHS_PARAM $EXCLUDE_CATEGORIES_PARAM $EXCLUDE_RESULTS_PARAM $EXCLUDE_QUERIES_PARAM $QUERIES_PARAM $VERBOSE_PARAM $IGNORE_ON_EXIT_PARAM $FAIL_ON_PARAM $TIMEOUT_PARAM $PROFILING_PARAM"
/app/bin/kics scan --no-progress $INPUT_PARAM $OUTPUT_PATH_PARAM $OUTPUT_FORMATS_PARAM $PLATFORM_TYPE_PARAM $PAYLOAD_PATH_PARAM $CONFIG_PATH_PARAM $EXCLUDE_PATHS_PARAM $EXCLUDE_CATEGORIES_PARAM $EXCLUDE_RESULTS_PARAM $EXCLUDE_QUERIES_PARAM $QUERIES_PARAM $VERBOSE_PARAM $IGNORE_ON_EXIT_PARAM $FAIL_ON_PARAM $TIMEOUT_PARAM $PROFILING_PARAM $SECRETS_REGEXES_PATH
