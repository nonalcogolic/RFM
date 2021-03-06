#ifndef DATARATE_H
#define DATARATE_H

#include "../ACommands.h"

namespace NTransmitter
{

class DataRate : public ACommands
{
public:
   DataRate();

   void setDataRate(const int32_t dataRate);
};

}

#endif // DATARATE_H
