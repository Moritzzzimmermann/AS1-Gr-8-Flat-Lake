from dataclasses import dataclass
from typing import List
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

INITIAL_SPEED=20
CARS_TOTAL=10
TICKS=1000
TRACK_LENGTH=200
MAX_SPEED=30
ACCELERATION=0.5
SAFE_DISTANCE=5
DECELERATION=20

@dataclass
class Car:
    speed: float
    position: float
    next_car: Car

    def step(self):
        self.adapt_speed()
        self.move()

    def move(self):
        self.position = (self.position + self.speed / 10) % TRACK_LENGTH

    def adapt_speed(self):
        gap = (self.next_car.position - self.position) % TRACK_LENGTH

        if self.speed < MAX_SPEED:
            self.speed += ACCELERATION
        
        if gap < SAFE_DISTANCE:
            self.speed = max(0, self.speed - DECELERATION)
        

def main():
    cars:List[Car] = []

    for car in range(CARS_TOTAL):
        cars.append(Car(speed=INITIAL_SPEED, position=car, next_car=None))

    for car_index in range(CARS_TOTAL):
        cars[car_index].next_car = cars[(car_index + 1) % CARS_TOTAL]

    positions_over_time = []
    for tick in range(TICKS):
        for car in cars:
            car.step()
        positions_over_time.append([car.position for car in cars])
    
    """visualization"""
    plt.figure(figsize=(10, 5))
    for i, pos in enumerate(positions_over_time):
        plt.scatter(pos, [i]*CARS_TOTAL, s=10)

    plt.xlabel("Position")
    plt.ylabel("Time")
    plt.title("Car Positions Over Time")
    plt.show()

    def update(frame):
        plt.cla()
        plt.scatter(positions_over_time[frame], [frame]*CARS_TOTAL, s=10)
        plt.xlabel("Position")
        plt.ylabel("Time")
        plt.title("Car Positions Over Time")    

    print(cars)


if __name__ == "__main__":
    main()