void main(){
    var mlPlay = "yes";
    var hero = "fighter/asassin";
    var skin = 3; // 1: Elite, 2: Special, 3: Epic
     
     if (mlPlay == "yes"){
        print("Welcome to Mobile Legends");

        if (hero == "fighter/asassin"){
            print("Zilong");

            switch (skin) {
                case 1:
                    print("Elite");
                    break;
                case 2:
                    print("Special");
                    break;
                case 3:
                    print("Epic");
                    break;
                default:
                    print("Basic");
            }
        } else {
            print("My type is marksman");
        }
     } else {
        print("Currently not playing, because i'm still learning");
     }
}