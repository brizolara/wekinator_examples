// Created by Rebecca Fiebrink 2015
//
//  Changes:
//
//  [Brizo] Sep/2016 - Added refreshInputs(); added call to refreshInputs in train()
public class WekinatorProxy {
   OscP5 oscP5;
   
   public WekinatorProxy(OscP5 oscP5) {
       this.oscP5 = oscP5;
   }

   //  deletes all examples and re-sends them (to account for moved points)
   public void refreshInputs(List<Example> a_allExamples) {
     deleteTraining();
     for(int i=0; i<a_allExamples.size(); i++) {
       startRecording();
       setClass(a_allExamples.get(i).c);
       sendInputs(a_allExamples.get(i).x, a_allExamples.get(i).y);
     }
   }

   public void sendInputs(int x, int y) {
       //println("Sending msg " + x + ","  + y);
       OscMessage msg = new OscMessage("/wek/inputs");
       msg.add((float)x); 
       msg.add((float)y);
       oscP5.send(msg, dest);
   }
  
   public void setClass(int c) {
       OscMessage msg = new OscMessage("/wekinator/control/outputs");
      // println("setting class to " + c);
       msg.add((float)c); 
       oscP5.send(msg, dest);
   }
   
   void startRecording() {
       OscMessage msg = new OscMessage("/wekinator/control/startRecording");
       //println("Recording");
       oscP5.send(msg, dest);
   }
   
   void stopRecording() {
       OscMessage msg = new OscMessage("/wekinator/control/stopRecording");
      // println("Stoping recording");
       oscP5.send(msg, dest);
   }
   
   //  
   void train(List<Example> a_allExamples) {
       refreshInputs(a_allExamples);
       OscMessage msg = new OscMessage("/wekinator/control/train");
       //println("Recording");
       oscP5.send(msg, dest);
   }
   
   void startRunning() {
       OscMessage msg = new OscMessage("/wekinator/control/startRunning");
      // println("Running");
       oscP5.send(msg, dest);
     
   }
   
   void stopRunning() {
       OscMessage msg = new OscMessage("/wekinator/control/stopRecording");
       //println("Stop running");
       oscP5.send(msg, dest);     
   }
   
   void deleteTraining() {
       OscMessage msg = new OscMessage("/wekinator/control/deleteAllExamples");
      // println("Deleting examples");
       oscP5.send(msg, dest);
   }
   
   public int getClassValue(OscMessage theOscMessage) {
      if (theOscMessage.checkAddrPattern("/wek/outputs")) {
        if(theOscMessage.checkTypetag("f")) {
          return (int) theOscMessage.get(0).floatValue();
        }
      }
      println("Error parsing class OSC message");
      return -1;
   }
}
