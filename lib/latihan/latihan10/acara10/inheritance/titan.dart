class Titan{
    double _powerPoint = 5;

    // Setter
    set powerPoint(double value){
      _powerPoint = value < 5 ? 5 : value;
    }

    // Getter
    double get powerPoint => _powerPoint;
}