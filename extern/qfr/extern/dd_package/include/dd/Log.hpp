/*
 * Log.hpp
 *
 *  Created on: Jun 15, 2022
 *      Author: lieuwe
 */

#ifndef INCLUDE_DD_LOG_HPP_
#define INCLUDE_DD_LOG_HPP_

#include "Definitions.hpp"

#include <iostream>
#include <vector>
#include <complex>

namespace dd {

    class _Log {
    public:
        bool verbose; //  0: silent
                      //  1: loud

        _Log(unsigned int _verbose):
            verbose(_verbose) {
        }

        template<class T>
        _Log& operator<<(const T& val) {
            if (verbose) {
                std::cout << val;
            }
            return *this;
        }

        void flush() const {
            if (verbose) {
                std::cout.flush();
            }
        }
    };

    class Log {
    public:
        static inline _Log log  = _Log(0);
        static inline char endl = '\n';
    };

    inline _Log& outputCVec(const CVec& vec) {
        Log::log << "[";
        for (unsigned int i = 0; i < vec.size(); i++) {
            Log::log << vec[i] << ", ";
        }
        return Log::log << "]";
    }

    inline void printCVec(const std::vector<std::complex<fp>>& vec) {
        Log::log << outputCVec(vec);
    }

    inline std::ostream& operator<<(std::ostream& out, const dd::CVec& vec) {
        for (unsigned int i = 0; i < vec.size(); i++) {
            out << vec[i] << ' ';
        }
        return out;
    }

    inline std::ostream& operator<<(std::ostream& out, [[maybe_unused]] const _Log& log) {
        return out;
    }

    //	Log Log::log(1);
    //	char Log::endl = '\n';
} // namespace dd

#endif /* INCLUDE_DD_LOG_HPP_ */
