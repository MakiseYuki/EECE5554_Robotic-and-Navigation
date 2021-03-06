/* LCM type definition class file
 * This file was automatically generated by lcm-gen
 * DO NOT MODIFY BY HAND!!!!
 */

package lab3gps_imu;
 
import java.io.*;
import java.util.*;
import lcm.lcm.*;
 
public final class gps_t implements lcm.lcm.LCMEncodable
{
    public double timestamp;
    public double altitude;
    public double utm_x;
    public double utm_y;
    public double lat;
    public double lon;
 
    public gps_t()
    {
    }
 
    public static final long LCM_FINGERPRINT;
    public static final long LCM_FINGERPRINT_BASE = 0x9d4e97b83154d73bL;
 
    static {
        LCM_FINGERPRINT = _hashRecursive(new ArrayList<Class<?>>());
    }
 
    public static long _hashRecursive(ArrayList<Class<?>> classes)
    {
        if (classes.contains(lab3gps_imu.gps_t.class))
            return 0L;
 
        classes.add(lab3gps_imu.gps_t.class);
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
        outs.writeDouble(this.timestamp); 
 
        outs.writeDouble(this.altitude); 
 
        outs.writeDouble(this.utm_x); 
 
        outs.writeDouble(this.utm_y); 
 
        outs.writeDouble(this.lat); 
 
        outs.writeDouble(this.lon); 
 
    }
 
    public gps_t(byte[] data) throws IOException
    {
        this(new LCMDataInputStream(data));
    }
 
    public gps_t(DataInput ins) throws IOException
    {
        if (ins.readLong() != LCM_FINGERPRINT)
            throw new IOException("LCM Decode error: bad fingerprint");
 
        _decodeRecursive(ins);
    }
 
    public static lab3gps_imu.gps_t _decodeRecursiveFactory(DataInput ins) throws IOException
    {
        lab3gps_imu.gps_t o = new lab3gps_imu.gps_t();
        o._decodeRecursive(ins);
        return o;
    }
 
    public void _decodeRecursive(DataInput ins) throws IOException
    {
        this.timestamp = ins.readDouble();
 
        this.altitude = ins.readDouble();
 
        this.utm_x = ins.readDouble();
 
        this.utm_y = ins.readDouble();
 
        this.lat = ins.readDouble();
 
        this.lon = ins.readDouble();
 
    }
 
    public lab3gps_imu.gps_t copy()
    {
        lab3gps_imu.gps_t outobj = new lab3gps_imu.gps_t();
        outobj.timestamp = this.timestamp;
 
        outobj.altitude = this.altitude;
 
        outobj.utm_x = this.utm_x;
 
        outobj.utm_y = this.utm_y;
 
        outobj.lat = this.lat;
 
        outobj.lon = this.lon;
 
        return outobj;
    }
 
}

