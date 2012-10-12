/*
 * Reflections
 * To show ways to reflect drawings
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 10/09/12
 */
 
import processing.pdf.*;

int cols;
int rows;

int[][] myArray;

// A boolean variable that when set to true triggers the PDF recording process
boolean recordPDF = false; 

void setup() {
  size(800,800, P3D);
  cols = width;
  rows = height;
  // Declare 2D array
  myArray = new int[rows][cols];
  
  // Initialize 2D array values
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if(i < width/2 && j < height/2) {
        myArray[i][j] = int(220);
      } else {
        myArray[i][j] = int(250);
      }
    }
  }

}

void draw() {
  
    // Begin making the PDF
  if (recordPDF) {
    beginRaw(PDF, "####.pdf" ); // If you include "####" in the filename -- "3D-####.pdf" -- separate, numbered PDFs will be made for each frame that is rendered.
  }


  // Draw points
  for (int i = 0; i < rows-1; i++) {
    for (int j = 0; j < cols-1; j++) {
      stroke(myArray[i][j]);
      point(i,j);
    }
  }
  
    // End making the PDF
  if (recordPDF) {
    endRaw();
    recordPDF = false;
  }

}

void mouseMoved() {
 
  if (mouseX < width/2 && mouseY < height/2) {
    myArray[mouseX][mouseY] = 0;
    myArray[(width/2-mouseX)+width/2][mouseY] = 0;
    myArray[mouseX][(height/2-mouseY)+height/2] = 0;
    myArray[(width/2-mouseX)+width/2][(height/2-mouseY)+height/2] = 0;
  }
  
}

// Make the PDF when the mouse is pressed
void mousePressed() {
  recordPDF = true;
}
