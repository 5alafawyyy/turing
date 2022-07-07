// Local Data of Static rooms
import 'package:flutter/material.dart';
import 'package:turing/data/models/static_room.dart';

final roomPages = [
  RoomModel(
    title: 'Programming',
    body: 'Programming is writing computer code to create a program, to solve a problem. Programs are created to implement algorithms . Algorithms can be represented as pseudocode or a flowchart , and programming is the translation of these into a computer program.',
    image: AssetImage('assets/images/programming.jpg'),
  ),
  RoomModel(
    title: 'Engineering',
    body: 'Engineering is the creative application of science, mathematical methods, and empirical evidence to the innovation, design, construction, and maintenance of structures, machines, materials, devices, systems, processes, and organizations. The discipline of engineering encompasses a broad range of more specialized fields of engineering, each with a more specific emphasis on particular areas of applied mathematics, applied science, and types of application.',
    image: AssetImage('assets/images/engineering.jpg'),
  ),
  RoomModel(
    title: 'Chemistry',
    body: 'What is chemistry and its types? Fundamentally, chemistry is the study of matter and change. The way that chemists study matter and change and the types of systems that are studied varies dramatically. Traditionally, chemistry has been broken into five main subdisciplines: Organic, Analytical, Physical, Inorganic and Biochemistry.',
    image: AssetImage('assets/images/chemistry.jpg'),
  ),
  RoomModel(
    title: 'Maths',
    body: 'Mathematics is the science that deals with the logic of shape, quantity and arrangement. Math is all around us, in everything we do. It is the building block for everything in our daily lives, including mobile devices, computers, software, architecture (ancient and modern), art, money, engineering and even sports.',
    image: AssetImage('assets/images/maths.jpg'),
  ),
  RoomModel(
    title: 'Physics',
    body: 'Physics is concerned with describing the interactions of energy, matter, space, and time, and it is especially interested in what fundamental mechanisms underlie every phenomenon. The concern for describing the basic phenomena in nature essentially defines the realm of physics.',
    image: AssetImage('assets/images/physics.jpg'),
  ),
];