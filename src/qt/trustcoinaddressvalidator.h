// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef TRUSTCOIN_QT_TRUSTCOINADDRESSVALIDATOR_H
#define TRUSTCOIN_QT_TRUSTCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class TrustcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit TrustcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Trustcoin address widget validator, checks for a valid trustcoin address.
 */
class TrustcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit TrustcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // TRUSTCOIN_QT_TRUSTCOINADDRESSVALIDATOR_H
