/* LCM type definition class file
 * This file was automatically generated by lcm-gen
 * DO NOT MODIFY BY HAND!!!!
 */

package lab3gps_imu;
 
import java.io.*;
import java.util.*;
import lcm.lcm.*;
 
public final class imu_t implements lcm.lcm.LCMEncodable
{
    public double yaw;
    public double pitch;
    public double roll;
    public double mag_x;
    public double mag_y;
    public double mag_z;
    public double acc_x;
    public double acc_y;
    public double acc_z;
    public double gyro_x_radps;
    public double gyro_y_radps;
    public double gyro_z_radps;
 
    public imu_t()
    {
    }
 
    public static final long LCM_FINGERPRINT;
    public static final long LCM_FINGERPRINT_BASE = 0xb98c5ade0dba8363L;
 
    static {
        LCM_FINGERPRINT = _hashRecursive(new ArrayList<Class<?>>());
    }
 
    public static long _hashRecursive(ArrayList<Class<?>> classes)
    {
        if (classes.contains(lab3gps_imu.imu_t.class))
            return 0L;
 
        classes.add(lab3gps_imu.imu_t.class);
        long hash = LCM_FINGERPRINT_BASE
            ;
        classes.remove(classes.size() - 1);
        return (hash<<1) + ((hash>>63)&1);
    }
 
    public void encode(DataOutput outs) throws IOException
    {
        outs.writeLong(LCM_FINGERPRINT);
        _encodeRecursive(outs);
    }
 
    public void _encodeRecursive(DataOutput outs) throws IOException
    {
        outs.writeDouble(this.yaw); 
 
        outs.writeDouble(this.pitch); 
 
        outs.writeDouble(this.roll); 
 
        outs.writeDouble(this.mag_x); 
 
        outs.writeDouble(this.mag_y); 
 
        outs.writeDouble(this.mag_z); 
 
        outs.writeDouble(this.acc_x); 
 
        outs.writeDouble(this.acc_y); 
 
        outs.writeDouble(this.acc_z); 
 
        outs.writeDouble(this.gyro_x_radps); 
 
        outs.writeDouble(this.gyro_y_radps); 
 
        outs.writeDouble(this.gyro_z_radps); 
 
    }
 
    public imu_t(byte[] data) throws IOException
    {
        this(new LCMDataInputStream(data));
    }
 
    public imu_t(DataInput ins) throws IOException
    {
        if (ins.readLong() != LCM_FINGERPRINT)
            throw new IOException("LCM Decode error: bad fingerprint");
 
        _decodeRecursive(ins);
    }
 
    public static lab3gps_imu.imu_t _decodeRecursiveFactory(DataInput ins) throws IOException
    {
        lab3gps_imu.imu_t o = new lab3gps_imu.imu_t();
        o._decodeRecursive(ins);
        return o;
    }
 
    public void _decodeRecursive(DataInput ins) throws IOException
    {
        this.yaw = ins.readDouble();
 
        this.pitch = ins.readDouble();
 
        this.roll = ins.readDouble();
 
        this.mag_x = ins.readDouble();
 
        this.mag_y = ins.readDouble();
 
        this.mag_z = ins.readDouble();
 
        this.acc_x = ins.readDouble();
 
        this.acc_y = ins.readDouble();
 
        this.acc_z = ins.readDouble();
 
        this.gyro_x_radps = ins.readDouble();
 
        this.gyro_y_radps = ins.readDouble();
 
        this.gyro_z_radps = ins.readDouble();
 
    }
 
    public lab3gps_imu.imu_t copy()
    {
        lab3gps_imu.imu_t outobj = new lab3gps_imu.imu_t();
        outobj.yaw = this.yaw;
 
        outobj.pitch = this.pitch;
 
        outobj.roll = this.roll;
 
        outobj.mag_x = this.mag_x;
 
        outobj.mag_y = this.mag_y;
 
        outobj.mag_z = this.mag_z;
 
        outobj.acc_x = this.acc_x;
 
        outobj.acc_y = this.acc_y;
 
        outobj.acc_z = this.acc_z;
 
        outobj.gyro_x_radps = this.gyro_x_radps;
 
        outobj.gyro_y_radps = this.gyro_y_radps;
 
        outobj.gyro_z_radps = this.gyro_z_radps;
 
        return outobj;
    }
 
}

