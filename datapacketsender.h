#ifndef DATAPACKETSENDER_H
#define DATAPACKETSENDER_H

#include <vector>



class IPinOut;
enum class ePin;

class DataPacketSender
{
public:
   /*
    * @data param is the sequence of 0 and 1
    */
   DataPacketSender(IPinOut & pinout, const std::vector<bool> & data);

   bool eof() const;
   bool sendNext();
   void reset();

   void setUsedPin(const ePin pin);

private:
   IPinOut & mPinout;
   const std::vector<bool> mData;
   std::vector<bool>::size_type mCursor;
   const std::vector<bool>::size_type mSize;
   ePin mUsedPin;
};


inline void DataPacketSender::setUsedPin(const ePin pin)
{
   mUsedPin = pin;
}

#endif // DATAPACKETSENDER_H
