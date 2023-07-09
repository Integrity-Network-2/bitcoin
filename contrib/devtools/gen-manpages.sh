#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

TRUSTCOIND=${TRUSTCOIND:-$BINDIR/trustcoind}
TRUSTCOINCLI=${TRUSTCOINCLI:-$BINDIR/trustcoin-cli}
TRUSTCOINTX=${TRUSTCOINTX:-$BINDIR/trustcoin-tx}
TRUSTCOINQT=${TRUSTCOINQT:-$BINDIR/qt/trustcoin-qt}

[ ! -x $TRUSTCOIND ] && echo "$TRUSTCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($TRUSTCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for trustcoind if --version-string is not set,
# but has different outcomes for trustcoin-qt and trustcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$TRUSTCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $TRUSTCOIND $TRUSTCOINCLI $TRUSTCOINTX $TRUSTCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
