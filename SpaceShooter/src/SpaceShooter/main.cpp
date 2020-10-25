#include <GameUtils/GameUtils.h>
#include <iostream>

int main(int, char *[])
{
    std::cout << "Hello Shooter" << std::endl;
    GameUtils::greet(std::cout);
    return 0;
}