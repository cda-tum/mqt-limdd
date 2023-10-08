#include "cxxopts.hpp"

#include <cmath>
#include <iostream>
#include <string>

static unsigned long long gcd(unsigned long long a, unsigned long long b) {
    unsigned long long c;
    while (a != 0) {
        c = a;
        a = b % a;
        b = c;
    }
    return b;
}

static bool is_prime(unsigned int number) {
    const unsigned int upper_limit = std::floor(std::sqrt(number));

    for (unsigned int a = 2; a <= upper_limit; a++) {
        if (number % a == 0) {
            return false;
        }
    }
    return true;
}

void output_coprimes(const unsigned int composite_number, const unsigned int length) {
    unsigned output_length  = 0;
    unsigned current_number = 2;

    while (output_length < length) {
        if (gcd(current_number, composite_number) == 1) {
            std::cout << current_number << "\n";
            output_length++;
        }
        current_number++;
    }
}

void output_primes(const unsigned int composite_number, const unsigned int length) {
    unsigned output_length  = 0;
    unsigned current_number = 2;

    while (output_length < length) {
        if (is_prime(current_number) && gcd(current_number, composite_number) == 1) {
            std::cout << current_number << "\n";
            output_length++;
        }
        current_number++;
    }
}

int main(int argc, char** argv) {
    cxxopts::Options options("MQT DDSIM", "see for more information https://www.cda.cit.tum.de/");
    // clang-format off
    options.add_options()
        ("h,help", "produce help message")
        ("N,composite_number", "number of measurements on the final quantum state", cxxopts::value<unsigned int>())
        ("S,strategy", "strategy for prime base generation (primes, coprimes)", cxxopts::value<std::string>())
        ("L,length", "how many bases to generate", cxxopts::value<unsigned int>());
    // clang-format on

    auto vm = options.parse(argc, argv);
    if (vm.count("help")) {
        std::cout << options.help();
        std::exit(0);
    }

    if (vm["strategy"].as<std::string>() == "coprimes") {
        output_coprimes(vm["composite_number"].as<unsigned int>(), vm["length"].as<unsigned int>());
    } else if (vm["strategy"].as<std::string>() == "primes") {
        output_primes(vm["composite_number"].as<unsigned int>(), vm["length"].as<unsigned int>());
    } else {
        std::cerr << "Invalid strategy.\n";
    }
}
