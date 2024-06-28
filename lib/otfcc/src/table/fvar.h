#ifndef CARYLL_TABLE_FVAR_H
#define CARYLL_TABLE_FVAR_H

#include "otfcc/table/fvar.h"

table_fvar *otfcc_readFvar(const otfcc_Packet packet, const otfcc::options_t &options);
void otfcc_dumpFvar(const table_fvar *table, json_value *root, const otfcc::options_t &options);

#endif
