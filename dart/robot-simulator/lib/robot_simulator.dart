import 'orientation.dart';
import 'position.dart';

class Robot {
  Position position;
  Orientation orientation;
  
  Robot(this.position, this.orientation);

  void move(String instructions) {
    for (final instruction in instructions.split('')){
      switch (instruction) {
        case 'R' :
          turnRight();
          break;

        case 'L' :
        turnLeft();
          break;

        case 'A' :
        advance();
          break;
      }
    }
  }
  void turnRight() {
    switch (orientation) {
      case Orientation.north:
        orientation = Orientation.east;
        break;

      case Orientation.east:
        orientation = Orientation.south;
        break;

      case Orientation.south: 
        orientation = Orientation.west;
        break;

      case Orientation.west:
        orientation = Orientation.north;
        break;   
    }
  }
  void turnLeft() {
    switch (orientation) {
      case Orientation.north:
        orientation = Orientation.west;
        break;

      case Orientation.west:
        orientation = Orientation.south;
        break;

      case Orientation.south:
        orientation = Orientation.east;
        break;

      case Orientation.east:
        orientation = Orientation.north;
        break;     
    }
  }
  void advance() {
    switch (orientation) {
      case Orientation.north:
        position = Position(position.x, position.y + 1);
        break;

      case Orientation.south:
        position = Position(position.x, position.y - 1);
        break;

      case Orientation.east:
        position = Position(position.x + 1, position.y);
        break;

      case Orientation.west:
        position = Position(position.x - 1, position.y);
        break;      
    }
  }
}
