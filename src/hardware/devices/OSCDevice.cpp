#include <string.h>

#include "OSCDevice.h"
#include "random.h"
#include "logging.h"

#include <oscpp/client.hpp>

OSCDevice::OSCDevice()
{
    channel_count = 512;
    address = sf::IpAddress("127.0.0.1");
    port_number = 53000;
    for (int i = 0; i < 512; i++) {
        osc_addresses[i] = "/emptyepsilon/channel/" + std::to_string(i);
    }
    socket.bind(0); // Bind to random port
}

bool OSCDevice::configure(std::unordered_map<string, string> settings)
{
    if (settings.find("channels") != settings.end())
    {
        LOG(INFO) << "Setting number of channels for OSCDevice to: " << settings["channels"].toInt();
        channel_count = std::max(1, std::min(512, settings["channels"].toInt()));
    }
    if (settings.find("server_address") != settings.end())
    {
        LOG(INFO) << "Setting IP address for OSCDevice to: " << settings["server_address"];
        address = sf::IpAddress(settings["server_address"]);
    }
    if (settings.find("port_number") != settings.end())
    {
        LOG(INFO) << "Setting port number for OSCDevice to: " << settings["port_number"];
        port_number = settings["port_number"].toInt();
    }
    if (settings.find("address_prefix") != settings.end())
    {
        LOG(INFO) << "Setting address prefix for OSCDevice to: " << settings["address_prefix"].strip();
        for (int i = 0; i < 512; i++) {
            osc_addresses[i] = settings["address_prefix"].strip() + std::to_string(i);
        }
    }
    if (settings.find("channel_addresses") != settings.end())
    {
        int i = 0;
        for(string channel_address : settings["channel_addresses"].split(","))
        {
            LOG(INFO) << "Setting address for OSCDevice channel " << i << " to: " << channel_address.strip();
            osc_addresses[i] = channel_address.strip();
            i++;   
        }
    }

    return true;
}

//Set a hardware channel output. Value is 0.0 to 1.0 for no to max output.
void OSCDevice::setChannelData(int channel, float value)
{
    uint8_t buffer[maximum_udp_packet_size] = {};
    OSCPP::Client::Packet packet(buffer, maximum_udp_packet_size);
    const char* osc_address = osc_addresses[channel].c_str();
    packet.openMessage(osc_address, 1).float32(value).closeMessage();
    LOG(INFO) << "OSC packet prepared for: " << osc_address << ", with value: " << value << ", packet size: " << packet.size();
    socket.send(buffer, packet.size(), address, port_number);
    LOG(INFO) << "Packet sent to: " << address.toString() << ", port number: " << port_number;
}

//Return the number of output channels supported by this device.
int OSCDevice::getChannelCount()
{
    return channel_count;
}