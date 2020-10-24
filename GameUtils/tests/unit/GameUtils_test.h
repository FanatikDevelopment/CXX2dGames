#ifndef GAMEUTILS_GAMEUTILS_TEST_H
#define GAMEUTILS_GAMEUTILS_TEST_H

#include <GameUtils/GameUtils.h>
#include <gtest/gtest.h>
#include <sstream>

TEST(GameUtils, greet_test)
{
    std::ostringstream oss;
    GameUtils::greet(oss);
    ASSERT_EQ(oss.str(), std::string("Hi Gamers !\n"))
      << "greet does not return the expected value";
}

#endif // GAMEUTILS_GAMEUTILS_TEST_H
