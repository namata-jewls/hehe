# Week 4: User Interactivity

**Name:** Julius Christian I. Namata <br/>
**Section:** U-2L <br/>
**Student number:** 2022-02219 <br/>

## Code Description
A user interactive app that allows user to input their name and other personal details. User input are summarized by using the save button, assuming that their input are valid. Inputs can also be reset using the respective button.

## Things you did in the code
I used the Form Widget as a parent to other form widgets like TextFormField. Using GlobalKey, I was able to validate, save, and reset the form fields. I instantiated other widgets like Switch, Dropdown, Radio, and Slider to be able to reset them, as they are not included in the builtin functions of the GlobalKey and Parent Form Widget. 

## Challenges encountered
I had trouble resetting some widgets like Switch, Dropdown, Radio, and Slider. It turned out that they cannot be reset using the formKey that I created. I also had trouble in passing the values between different classes.

## Commit Log

1. Initial commit
2. Added The Tita Slambook Form
3. Added reset button functionality
4. Edited README.md file

## References

- 