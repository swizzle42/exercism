#include <string>

namespace log_line {
std::string message(std::string line) {
    // return the message
    auto colon = line.find(":");
    return line.substr(colon + 2);
}

std::string log_level(std::string line) {
    // return the log level
    auto end_bracket = line.find("]");
    return line.substr(1, end_bracket - 1);
}

std::string reformat(std::string line) {
    // return the reformatted message
    return message(line) + " (" + log_level(line) + ")";
}
}  // namespace log_line
