#!/bin/bash

# exit immediately upon first error
set -e -x

# build egg-herbie to make sure updated
cargo build --release --manifest-path=egg-herbie/Cargo.toml

SEED=0
CORES=16
BENCHMARKS="bench/"
TIMEOUT=300

racket src/herbie.rkt report --threads "$CORES" --no-pareto --seed "$SEED" --timeout "$TIMEOUT"  "$BENCHMARKS" egglogreport

racket src/herbie.rkt report --threads "$CORES" --timeout "$TIMEOUT" --seed "$SEED" --disable generate:egglog --no-pareto "$BENCHMARKS" vanillareport


bash egglogreport.sh
