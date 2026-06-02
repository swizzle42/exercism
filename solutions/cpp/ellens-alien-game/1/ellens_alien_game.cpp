namespace targets {

    class Alien {
        public:
        Alien(int x, int y) {
            x_coordinate = x;
            y_coordinate = y;
        }

        int get_health() {
            return health;
        }

        bool hit() {
            this->health > 0 ? this->health-- : this->health;
            return true;
        }

        bool is_alive() {
            return this->health > 0;
        }

        bool teleport(int x_new, int y_new) {
            this->x_coordinate = x_new;
            this->y_coordinate = y_new;

            return true;
        }

        bool collision_detection(Alien other) {
            return (this->x_coordinate == other.x_coordinate && this->y_coordinate == other.y_coordinate);
        }

        int x_coordinate {0};
        int y_coordinate {0};

        private:
        int health {3};
    };

}  // namespace targets
