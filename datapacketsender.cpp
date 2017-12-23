#include "datapacketsender.h"
#include "ipinout.h"

DataPacketSender::DataPacketSender(IPinOut & pinout, const std::vector<bool> &data)
   : mPinout(pinout)
   , mData(data)
   , mCursor(0)
   , mSize(data.size())
{}

bool DataPacketSender::eof() const
{
   return mCursor == mSize;
}

void DataPacketSender::sendNext()
{
   if (!eof())
   {
      mPinout.setPinStateForce(mData[mCursor], ePin::tr_NIRQ);
      ++mCursor;
   }
}

void DataPacketSender::reset()
{
   mCursor = 0;
}
