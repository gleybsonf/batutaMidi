import themidibus.*; //Import the library

MidiBus bus1; 
MidiBus bus2; 
MidiBus bus3;
MidiBus bus4; 
MidiBus bus5; 
MidiBus bus6;

void setup() {
  size(400, 400);
  background(0);

  MidiBus.list(); //List all available Midi devices. This will show each device's index and name.

  //This is a different way of listing the available Midi devices.
  println(); 
  println("Available MIDI Devices:"); 

  System.out.println("----------Input (from availableInputs())----------");
  String[] available_inputs = MidiBus.availableInputs(); //Returns an array of available input devices
  for (int i = 0; i < available_inputs.length; i++) System.out.println("["+i+"] \""+available_inputs[i]+"\"");

  System.out.println("----------Output (from availableOutputs())----------");
  String[] available_outputs = MidiBus.availableOutputs(); //Returns an array of available output devices
  for (int i = 0; i < available_outputs.length; i++) System.out.println("["+i+"] \""+available_outputs[i]+"\"");

  System.out.println("----------Unavailable (from unavailableDevices())----------");
  String[] unavailable = MidiBus.unavailableDevices(); //Returns an array of unavailable devices
  for (int i = 0; i < unavailable.length; i++) System.out.println("["+i+"] \""+unavailable[i]+"\"");

  bus1 = new MidiBus(this, 2, -1, "bus1");
  bus2 = new MidiBus(this, 3, -1, "bus2");
  bus3 = new MidiBus(this, 4, -1, "bus3");
  bus4 = new MidiBus(this, 5, -1, "bus4");
  //bus5 = new MidiBus(this, 6, -1, "bus5");
  //bus6 = new MidiBus(this, 3, -1, "bus6");

  //busA.addOutput("OutgoingC"); //Add a new output device to busA called OutgoingC
  //busB.addInput("IncomingC"); //Add a new input device to busB called IncommingC

  //It is also possible to check what devices are currently attached as inputs or outputs on a bus

  //println();
  //println("Inputs on busA");
  //println(busA.attachedInputs()); //Print the devices attached as inputs to busA
  //println();
  //println("Outputs on busB");
  //println(busB.attachedOutputs()); //Prints the devices attached as outpus to busB
}

void draw() {
  //int channel = 0;
  //int pitch = 64;
  //int velocity = 127;

  //busA.sendNoteOn(channel, pitch, velocity); //Send a noteOn to OutgoingA and OutgoingC through busA
  //delay(200);
  //busB.sendNoteOn(channel, pitch, velocity); //Send a noteOn to OutgoingB through busB
  //delay(100);
  //busA.sendNoteOff(channel, pitch, velocity); //Send a noteOff to OutgoingA and OutgoingC through busA
  //busB.sendNoteOff(channel, pitch, velocity); //Send a noteOff to OutgoingB through busB

  //int number = 0;
  //int value = 90;

  //busA.sendControllerChange(channel, number, value); //Send a controllerChange to OutgoingA and OutgoingC through busA
  //busB.sendControllerChange(channel, number+10, value+10); //Send a controllerChange to OutgoingB through busB
  //delay(2000);
}

void noteOn(int channel, int pitch, int velocity, long timestamp, String bus_name) {
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  println("Timestamp:"+timestamp);
  println("Recieved on Bus:"+bus_name);
  if (bus_name == "bus1") {
    println("This came from IncomingA");
  } else if (bus_name == "bus2") {
    println("This came from IncomingB or IncomingC");
  }
}

void noteOff(int channel, int pitch, int velocity, long timestamp, String bus_name) {
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  println("Timestamp:"+timestamp);
  println("Recieved on Bus:"+bus_name);
  if (bus_name == "bus1") {
    println("This came from IncomingA");
  } else if (bus_name == "bus2") {
    println("This came from IncomingB or IncomingC");
  }
}

void controllerChange(int channel, int number, int value, long timestamp, String bus_name) {
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  println("Timestamp:"+timestamp);
  println("Recieved on Bus:"+bus_name);
  if (bus_name == "busA") {
    println("This came from IncomingA");
  } else if (bus_name == "busB") {
    println("This came from IncomingB or IncomingC");
  }
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}