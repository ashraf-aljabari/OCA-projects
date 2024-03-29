import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';

const orderSchema = mongoose.Schema(
  {
    products: {
      type: Array,
      required: true,
    },
    totalPrice: {
      type: String,
      required: true,
    },
    address: {
      type: Object,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);

// user schema model.
const userSchema = mongoose.Schema(
  {
    username: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
    },
    address: {
      type: Object,
    },
    orders: [orderSchema],
    isAdmin: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  {
    timestamps: true,
  }
);

// user model function for matching entered password
// with the encrypted password in the database.
userSchema.methods.matchPassword = async function (enteredPassword) {
  return await bcrypt.compare(enteredPassword, this.password);
};

// user model function for checking if user password is
// modified after edit to change it in the db else
// keep it the same.
userSchema.pre('save', async function (next) {
  if (!this.isModified('password')) {
    next();
  }

  const salt = await bcrypt.genSalt(10);
  this.password = await bcrypt.hash(this.password, salt);
});

const User = mongoose.model('User', userSchema);

export default User;
