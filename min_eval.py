#!/usr/bin/env python3
import re
import argparse
import sys

RE_EVAL = re.compile(r'([+-]?\d+\.\d+)\s*$')
RE_RUN = re.compile(r'^\s*(\d+)')


def find_min_eval(path):
    results = []
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        for i, line in enumerate(f, start=1):
            m = RE_EVAL.search(line)
            if not m:
                continue
            try:
                val = float(m.group(1))
            except ValueError:
                continue
            run_m = RE_RUN.match(line)
            run = run_m.group(1) if run_m else None
            results.append((val, i, run, line.rstrip()))
    if not results:
        return None
    return min(results, key=lambda x: x[0])


if __name__ == '__main__':
    p = argparse.ArgumentParser(description='Find minimum eval value in final_results.txt')
    p.add_argument('file', nargs='?', default='final_results.txt', help='Path to results file')
    args = p.parse_args()
    res = find_min_eval(args.file)
    if res is None:
        print('No eval values found in', args.file, file=sys.stderr)
        sys.exit(2)
    val, lineno, run, line = res
    print(f'Minimum eval: {val}')
    if run is not None:
        print(f'Run: {run}, Line: {lineno}')
    print('Line content:')
    print(line)
