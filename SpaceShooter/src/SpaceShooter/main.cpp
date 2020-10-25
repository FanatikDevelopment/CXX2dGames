#include <GameUtils/GameUtils.h>
#include <iostream>

using namespace std;

int main(int, char *[])
{
    cout << "Hello Shooter" << endl;
    GameUtils::greet(cout);
    return 0;
}